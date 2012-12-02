function check = multinomial_check ( a, b, c )

%*****************************************************************************80
%
%% MULTINOMIAL_CHECK checks the parameters of the Multinomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of trials.
%
%    Input, integer B, the number of outcomes possible on one trial.
%    1 <= B.
%
%    Input, real C(B).  C(I) is the probability of outcome I on
%    any trial.
%    0.0 <= C(I) <= 1.0,
%    Sum ( 1 <= I <= B ) C(I) = 1.0.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( b < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MULTINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < 1.\n' );
    check = 0;
    return
  end

  for i = 1 : b

    if ( c(i) < 0.0 | 1.0 < c(i) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MULTINOMIAL_CHECK - Fatal error!\n' );
      fprintf ( 1, '  Input C(I) is out of range.\n' );
      check = 0;
      return
    end

  end

  c_sum = sum ( c(1:b) );

  if ( 0.0001 < abs ( 1.0 - c_sum ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MULTINOMIAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The probabilities do not sum to 1.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
