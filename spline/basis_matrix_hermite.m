function mbasis = basis_matrix_hermite ( )

%*****************************************************************************80
%
%% BASIS_MATRIX_HERMITE sets up the Hermite spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points are stored as
%    ( P1, P2, P1', P2' ), with P1 and P1' being the data value and 
%    the derivative dP/dT at T = 0, while P2 and P2' apply at T = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics: Principles and Practice,
%    page 484.
%
%  Parameters:
%
%    Output, real MBASIS(4,4), the basis matrix.
%
  mbasis(1,1) =  2.0;
  mbasis(1,2) = -2.0;
  mbasis(1,3) =  1.0;
  mbasis(1,4) =  1.0;

  mbasis(2,1) = -3.0;
  mbasis(2,2) =  3.0;
  mbasis(2,3) = -2.0;
  mbasis(2,4) = -1.0;

  mbasis(3,1) =  0.0;
  mbasis(3,2) =  0.0;
  mbasis(3,3) =  1.0;
  mbasis(3,4) =  0.0;

  mbasis(4,1) =  1.0;
  mbasis(4,2) =  0.0;
  mbasis(4,3) =  0.0;
  mbasis(4,4) =  0.0;

  return
end
