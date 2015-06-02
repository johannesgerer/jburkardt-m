function yi = interpolant_value ( d, r, pn, po, pc, pe, pd, ni, xi )

%*****************************************************************************80
%
%% INTERPOLANT_VALUE evaluates a Lagrange interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer R, the maximum number of terms in any polynomial.
%
%    Input, integer PN, the number of polynomials.
%
%    Input, integer PO(PN), the "order" of the polynomials.
%
%    Input, real PC(PN,R), the coefficients of the polynomial.
%
%    Input, integer PE(PN,R), the indices of the exponents of the polynomial.
%
%    Input, real PD(PN), the coefficient of each polynomial.  
%    For a Lagrange interpolant, this is the data value at each Lagrange point.
%
%    Input, integer NI, the number of interpolant evaluation points.
%
%    Input, real XI(D,NI), the coordinates of the interpolation evaluation points.
%
%    Output, real YI(NI), the value of the interpolant at XI.
%  
  yi = zeros ( ni, 1 );

  for j = 1 : pn
    oj = po(j);
    value(1:ni,1) = polynomial_value ( d, oj, pc(j,1:oj), pe(j,1:oj), ni, xi ); 
    yi(1:ni,1) = yi(1:ni,1) + pd(j,1) * value(1:ni,1);
  end    

  return
end
