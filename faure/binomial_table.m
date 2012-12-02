function coef = binomial_table ( qs, m, n )

%*****************************************************************************80
%
%% BINOMIAL_TABLE computes a table of bionomial coefficients MOD QS.
%
%  Discussion:
%
%    Thanks to Michael Baudin for pointing out an error in a previous
%    version of this function, 07 December 2009.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer QS, the base for the MOD operation.
%
%    Input, integer M, N, the limits of the binomial table.
%
%    Output, integer COEF(0:M,0:N), the table of binomial coefficients
%    modulo QS.
%
  coef = zeros ( m+1, n+1 );

  coef(1:m+1,1) = 1;

  for j = 1 : min ( m, n )
    coef(j+1,j+1) = 1;
  end

  for j = 1 : n
    for i = j + 1 : m
      coef(i+1,j+1) = mod ( coef(i,j+1) + coef(i,j), qs );
    end
  end

  return
end
