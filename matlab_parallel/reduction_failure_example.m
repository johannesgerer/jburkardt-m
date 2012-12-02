function reduction_failure_example ( )

%*****************************************************************************80
%
%% REDUCTION_FAILURE_EXAMPLE shows how MATLAB fails to handle a reduction.
%
%  Discussion:
%
%    When using MATLAB's parallel programming features, the user relies
%    on MATLAB's ability to correctly determine the status of the variables
%    in a parallel loop.
%
%    A user may be comfortable with the notions of "shared", "private"
%    and "reduction" variables.  In OpenMP, for instance, the user may
%    explicitly declare one of these statuses for every variable in a 
%    loop that is to be parallelized.
%
%    When using MATLAB, however, the user does not explicitly denote the
%    status of variables.  Instead, MATLAB attempts to deduce the user's 
%    intent from the way the variables are used in the loop.  If MATLAB's
%    interpretation does not match the user's intent, then this discrepancy
%    may result in a variable being given the wrong classification.
%    MATLAB may warn the user if the usage seems questionable, or it
%    may generate parallel code that does not reflect the user's intent,
%    and which fails or computes unwanted results.
%  
%    It's not that MATLAB is wrong - it's just that an extra layer of
%    complication has been inserted into the process of code generation,
%    and it thus becomes harder for the user to realize when a given
%    source code is not being translated into the appropriate parallel
%    instructions.
%
%
%    This example exhibits a simplified version of such a problem, which
%    was encountered while running a parallel benchmark code.  The code
%    involved a reduction variable.  A reduction variable is a variable 
%    to which all threads or processes or workers will contribute, but in 
%    such a way that the order of these contributions doesn't really matter to
%    the final result.  The classic example of such a variable is a sum.
%    A reduction variable is a sort of hybrid between a local variable 
%    (each process can modify it) and a shared variable (its value is known 
%    by all processes), and its value is retained 
%    upon exiting the loop.
%
%    When interpreting the user's code, MATLAB needs to recognize reduction
%    variables and treat them correctly.  MATLAB identifies a reduction 
%    variable by how it is used.  The rules are remarkably rigid.  A variable
%    will be recognized as a reduction variable if the ONLY occurrences of
%    that variable within the parallel loop are in reduction statements,
%    such as:
%
%      u = u + q(i);
%      v = v + 1;
%      w = w * r(j);
%      y = y * 2;
%
%    If, however, the variable appears, inside the loop, in ANY other kind
%    of statement, MATLAB assumes that the variable is NOT a reduction variable.
%    In that case, MATLAB is likely to classify the variable as a "temporary"
%    variable, in other words, a variable whose value is essentially a function
%    of the loop index.
%
%
%    Here is a classic instance of a temporary variable,
%    in that "DX" is simply a convenient abbreviation for a quantity
%    whose value is reassigned and used on each iteration.
%
%    for i = 1 : n
%      dx = x(i+1) - x(i);
%      dudx = u(i+1) - u(i) / dx;
%    end
%
%    Temporary variables MUST be given a value before being used, and
%    that value assignment MUST occur inside the body of the loop.
%
%
%    Now, suppose we want to examine all the integers from 1 to 100
%    and count how many are divisible by 7.  The variable DIVISIBLE,
%    which is incremented each time we find such a case, is an example
%    of a reduction variable:
%
%      divisible = 0;
%      for i = 1 : n
%        if ( mod ( i, 7 ) == 0 )
%          divisible = divisible + 1;
%          fprintf ( 1, '  Found that %d is divisible by 7.\n', i );
%        end
%      end
%
%    This code works fine.  You can replace "for" by "parfor" and MATLAB 
%    will recognize that DIVISIBLE is a reduction variable and run the loop in
%    parallel.
%
%
%    Now, being human, let's make a mistake.  Let's insert a statement that
%    will print out the value of DIVISIBLE along with the value of I, so that
%    each solution is indexed.  That will work fine sequentially, but if you
%    think about it, this doesn't really make sense in parallel.  DIVISIBLE,
%    being a reduction variable, can be incremented, but its value can't really
%    be defined until after the loop is complete.  So if we declared DIVISIBLE
%    to be a reduction variable, and then tried to print it, the compiler would
%    probably complain to us.  However, in MATLAB, we don't declare variables
%    and then use them.  Instead, our use implicitly "declares" them.  So by
%    inserting the print statement, we have accidentally "declared" that
%    DIVISIBLE cannot be a reduction variable.  In that case, the only variable
%    type left for MATLAB to consider is the "temporary variable" type.
%    That is not what we wanted, but that's what is going to happen.
%
%      divisible = 0;
%      parfor i = 1 : n
%        if ( mod ( i, 7 ) == 0 )
%          divisible = divisible + 1;
%          fprintf ( 1, '  Solution number %d, %d is divisible by 7.\n', divisible, i );
%        end
%      end
%
%    If you try to run this code, then depending on the version of the Parallel
%    Toolbox that you have, MATLAB may issue a message that a reduction variable
%    is probably being misused, or MATLAB may mysteriously complain that
%    the temporary variable DIVISIBLE has not been initialized.  What?
%    It's been set just before we entered the loop.  No, MATLAB doesn't
%    see it that way.  Because DIVISIBLE was used in the print statement,
%    it can't be a reduction variable.  The only other possible category
%    is "temporary", so DIVISIBLE "must" be a temporary variable.  Since
%    DIVISIBLE is a temporary variable, assignments to DIVISIBLE outside the
%    loop are ignored.  DIVISIBLE must be given a value in each iteration
%    of the loop, before it is used.  But the statement "divisible = divisible + 1"
%    is not preceded by any such assignment, therefore MATLAB cannot execute
%    this code.
%
%    Of course it works fine sequentially.  And the point is, MATLAB is
%    correct in that you really shouldn't try to use the value of a reduction
%    variable within a loop where it is being constructed.  The problem is
%    that MATLAB's way of dealing with this problem is not to say
%    "It looks like you want DIVISIBLE to be a reduction variable, but
%    there are reasons why that won't be allowed."  Instead, it silently
%    guesses that DIVISIBLE must be a temporary, and waits til runtime,
%    when that guess explodes, to let you know that something is wrong.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'REDUCTION_FAILURE_EXAMPLE:\n' );
  fprintf ( 1, '  The MATLAB PARFOR command can carry out certain\n' );
  fprintf ( 1, '  "reduction" operations in parallel.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  However, MATLAB detects reduction variables only when\n' );
  fprintf ( 1, '  they conform to a very strict pattern.  In particular,\n' );
  fprintf ( 1, '  a reduction variable may only occur in statements like:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    x = x + 1;\n' );
  fprintf ( 1, '    x = x - y(k)\n' );
  fprintf ( 1, '    x = x * z(j)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If a variable is used in ANY OTHER WAY inside the loop,\n' );
  fprintf ( 1, '  for example, in a print statement, or in a logical check,\n' );
  fprintf ( 1, '  MATLAB refuses to classify it as a reduction variable.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Instead, the variable will be classified as a TEMPORARY.\n' );
  fprintf ( 1, '  Depending on your version of the MATLAB Parallel Toolbox,\n' );
  fprintf ( 1, '  you may be a warning (probable reduction variable misused)\n' );
  fprintf ( 1, '  or at run time the loop will fail because the temporary\n' );
  fprintf ( 1, '  is not initialized inside the loop.\n' );
%
%  Set up a random data vector.
%
  n = 100;
  x = rand ( n );
%
%  Sum its entries sequentially.  THIS WORKS.
%
  total = 0.0;
  for i = 1 : n
    total = total + x(i);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum all entries of X, in sequential mode:\n' );
  fprintf ( 1, '  TOTAL = %f\n', total );
%
%  Sum its entries in parallel.  THIS WORKS.
%
  total = 0.0;
  parfor i = 1 : n
    total = total + x(i);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum all entries of X, in parallel mode:\n' );
  fprintf ( 1, '  TOTAL = %f\n', total );
%
%  Sum its entries and print the total every 10th step.  THIS WILL FAIL IN PARALLEL MODE.
%
  total = 0.0;
  for i = 1 : n
    total = total + x(i);
    if ( mod ( i, 10 ) == 0 )
      fprintf ( 1, '  Total of first %d values is %f\n', i, total );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum all entries of X, print some partial sums.\n' );
  fprintf ( 1, '  TOTAL = %f\n', total );
%
%  Sum entries but stop if we exceed 10.  THIS WILL FAIL IN PARALLEL MODE.
%
  total = 0.0;
  parfor i = 1 : n
    if ( total < 10 )
      total = total + x(i);
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum all entries of X until we exceed 10.\n' );
  fprintf ( 1, '  TOTAL = %f\n', total );

  return
end
