function value = p31_exact ( dim_num )

%*****************************************************************************80
%
%% P31_EXACT returns the exact integral for problem 31.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Kenneth Hanson,
%    Quasi-Monte Carlo: halftoning in high dimensions?
%    in Computatinal Imaging,
%    Edited by CA Bouman and RL Stevenson,
%    Proceedings SPIE,
%    Volume 5016, 2003, pages 161-172.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real VALUE, the exact value of the integral.
%

%
%  Get the limits of integration.
%
  [ a, b ] = p31_lim ( dim_num );
%
%  Get the coefficient vector C.
%
  c = [];
  c = p31_r8vec ( 'G', 'C', dim_num, c );
%
%  Get the location of Z.
%
  z = [];
  z = p31_r8vec ( 'G', 'Z', dim_num, z );
%
%  The value of the DIM_NUM dimensional integral is separable
%  into the product of integrals over each dimension.
%
%  Each of these 1 dimensional integrals, in turn, is
%  easily computed, depending on where Z(I) lies with
%  respect to the limits of integration A(I) and B(I).
%
  value = 1.0;

  for i = 1 : dim_num
%
%  Z < A < B
%
%  | X - Z | = X - Z from A to B.
%
    if ( z(i) < a(i) )

      value = value * ...
      ( exp ( - c(i) * ( a(i) - z(i) ) ) ...
      - exp ( - c(i) * ( b(i) - z(i) ) ) ) / c(i);
%
%  A < Z < B
%
%  | X - Z | = Z - X from B to Z, 
%            = X - Z from      Z to A.
%
    elseif ( z(i) < b(i) )

      value = value * ( 2.0 ...
          - exp ( - c(i) * ( z(i) - a(i) ) ) ...
          - exp ( - c(i) * ( b(i) - z(i) ) ) ) / c(i);
%
%  A < B < Z
%
%  | X - Z | = Z - X from A to B.
%
    else

      value = value * ...
      ( exp ( - c(i) * ( z(i) - b(i) ) ) ...
      - exp ( - c(i) * ( z(i) - a(i) ) ) ) / c(i);

    end

  end

  return
end
