function check = empirical_discrete_check ( a, b, c )

%*****************************************************************************80
%
%% EMPIRICAL_DISCRETE_CHECK checks the parameters of the Empirical Discrete CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of values.
%    0 < A.
%
%    Input, real B(A), the weights of each value.
%    0 <= B(1:A) and at least one value is nonzero.
%
%    Input, real C(A), the values.
%    The values must be distinct and in ascending order.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EMPIRICAL_DISCRETE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A must be positive.\n' );
    fprintf ( 1, '  Input A = %d\n', a );
    fprintf ( 1, '  A is the number of weights.\n' );
    check = 0;
    return
  end

  for i = 1 : a
    if ( ( b(i) < 0.0 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'EMPIRICAL_DISCRETE_CHECK - Fatal error!\n' );
      fprintf ( 1, '  Some B(*) < 0.\n' );
      fprintf ( 1, '  But all B values must be nonnegative.\n' );
      check = 0;
      return
    end
  end

  if ( b(1:a) == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EMPIRICAL_DISCRETE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  All B(*) = 0.\n' );
    fprintf ( 1, '  But at least one B values must be nonzero.\n' );
    check = 0;
    return
  end

  for i = 1 : a
    for j = i+1 : a
      if ( c(i) == c(j) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'EMPIRICAL_DISCRETE_CHECK - Fatal error!\n' );
        fprintf ( 1, '  All values C must be unique.\n' );
        fprintf ( 1, '  But at least two values are identical.\n' );
        check = 0;
        return
      end
    end
  end

  for i = 1 : a-1
    if ( c(i+1) < c(i) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'EMPIRICAL_DISCRETE_CHECK - Fatal error!\n' );
      fprintf ( 1, '  The values in C must be in ascending order.\n' );
      check = 0;
      return
    end
  end

  check = 1;

  return
end
