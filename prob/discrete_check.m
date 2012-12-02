function check = discrete_check ( a, b )

%*****************************************************************************80
%
%% DISCRETE_CHECK checks the parameters of the Discrete CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of probabilities assigned.
%
%    Input, real B(A), the relative probabilities of
%    outcomes 1 through A.  Each entry must be nonnegative.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  for j = 1 : a
    if ( b(j) < 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DISCRETE_CHECK - Fatal error!\n' );
      fprintf ( 1, '  Negative probabilities not allowed.\n' );
      check = 0;
      return
    end
  end

  b_sum = sum ( b(1:a) );

  if ( b_sum == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DISCRETE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Total probablity is zero.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
