function kronrod_test03 ( )

%*****************************************************************************80
%
%% KRONROD_TEST03 uses the program to estimate an integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
  exact = 1.5643964440690497731;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KRONROD_TEST03\n' );
  fprintf ( 1, '  Call Kronrod to estimate the integral of a function.\n' );
  fprintf ( 1, '  Keep trying until the error is small.\n' );
%
%  TOL just tells KRONROD how carefully it must compute X, W1 and W2.
%  It is NOT a statement about the accuracy of your integral estimate!
%
  tol = 0.000001;
%
%  Start the process with a 1 point rule.
%
  n = 1;

  while ( 1 )

    [ x, w1, w2 ] = kronrod ( n, tol );
%
%  Compute the estimates.
%  There are two complications here:
%
%  1) Both rules use all the points.  However, the lower order rule uses
%     a zero weight for the points it doesn't need.
%
%  2) The points X are all positive, and are listed in descending order.
%     this means that 0 is always in the list, and always occurs as the
%     last member.  Therefore, the integral estimates should use the
%     function value at 0 once, and the function values at the other
%     X values "twice", that is, once at X and once at -X.
%
    i1 = w1(n+1) * f ( x(n+1) );
    i2 = w2(n+1) * f ( x(n+1) );

    for i = 1 : n
      i1 = i1 + w1(i) * ( f ( - x(i) ) + f ( x(i) ) );
      i2 = i2 + w2(i) * ( f ( - x(i) ) + f ( x(i) ) );
    end

    if ( abs ( i1 - i2 ) < 0.0001 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Error tolerance satisfied with N = %d\n', n );
      fprintf ( 1, '  Coarse integral estimate = %14.6g\n', i1 );
      fprintf ( 1, '  Fine   integral estimate = %14.6g\n', i2 );
      fprintf ( 1, '  Error estimate = %g\n', abs ( i2 - i1 ) );
      fprintf ( 1, '  Actual error =   %g\n', abs ( exact - i2 ) );
      break;
    end

    if ( 25 < n )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Error tolerance failed even for n = %d\n', n );
      fprintf ( 1, '  Canceling iteration, and accepting bad estimates!\n' );
      fprintf ( 1, '  Coarse integral estimate = %14.6g\n', i1 );
      fprintf ( 1, '  Fine   integral estimate = %14.6g\n', i2 );
      fprintf ( 1, '  Error estimate = %g\n', abs ( i2 - i1 ) );
      fprintf ( 1, '  Actual error =   %g\n', abs ( exact - i2 ) );
      break;
    end

    n = 2 * n + 1;

  end

  return
end
function value = f ( x )

%*****************************************************************************80
%
%% F is a function whose integral from -1 to +1 is to be estimated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, double X, the argument.
%
%    Output, double F, the value.
%
  value = 1.0 / ( x * x + 1.005 );

  return;
end

