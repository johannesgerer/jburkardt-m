function q = p03_q ( m, c, w )

%*****************************************************************************80
%
%% P03_Q evaluates the integral for problem p03.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Genz,
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    Reidel, 1987, pages 337-340,
%    ISBN: 9027725144,
%    LC: QA299.3.N38.
%
%  Parameters:
%
%    Input, integer M, the dimension of the argument.
%
%    Input, real C(M), W(M), the problem parameters.
%
%    Output, real Q, the integral.
%
  c = c(:);
%
%  Here, we need to generate all possible DIM_NUM tuples with
%  values of 0 or 1.
% 
  q = 0.0;
  rank = 0;
  ivec = zeros ( m, 1 );

  while ( 1 )

    [ rank, ivec ] = tuple_next ( 0, 1, m, rank, ivec );

    if ( rank == 0 )
      break
    end

    s = sum ( ivec(1:m) );

    q = q + r8_mop ( s ) / ( 1.0 + c(1:m,1)' * ivec(1:m,1) );

  end

  q = q / ( r8_factorial ( m ) * prod ( c(1:m) ) );

  return
end
