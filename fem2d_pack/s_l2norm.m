function l2norm = s_l2norm ( psi_num, element_num, quad_num, element_area, ...
  quad_weight, psi_quad, s_coef )

%*****************************************************************************80
%
%% S_L2NORM computes the "big" L2 norm of a scalar function over a region.
%
%  Discussion:
%
%    It is assumed that a set of finite element basis functions PSI
%    have been defined over a collection of elements that compose
%    the region.  Moreover, integrals over the region are assumed to
%    be approximated by applying a fixed quadrature rule to all the
%    elements.
%
%    Finally, we assume that we have a scalar function S(X), which
%    is represented as a linear combination of basis functions, and
%    it is desired to determine the L2 norm of S.
%
%    This routine estimates the integral
%
%      Sqrt ( Integral ( X in Omega ) S(X) * S(X) dOmega )
%
%    using the finite element representation of S, and applying the
%    given quadrature rule.
%
%    It assumes that a (probably very large) array of data is available,
%    recording the value of each basis function PSI in every element
%    at every quadrature point.  If this is true, then the computation
%    becomes very simple.
%
%    If your problem is small or sufficient memory is available, this
%    may be an efficient computation.  It requires that the value of
%    all the basis functions be stored for all the elements and all
%    the quadrature points.  That particular information need only
%    be computed once.
%
%    Actually, no assumptions are made here about the dimension of the
%    space, so this same code can handle problems in 1D, 2D, 3D and
%    so on.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PSI_NUM, the number of global element functions.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer QUAD_NUM, the number of points in the quadrature rule.
%
%    Input, real ELEMENT_AREA(ELEMENT_NUM), the area of
%    each element.
%
%    Input, real QUAD_WEIGHT(QUAD_NUM), the quadrature
%    weights associated with the quadrature points.
%
%    Input, real PSI_QUAD(PSI_NUM,ELEMENT_NUM,QUAD_NUM), the
%    value of the I-th PSI function in the J-th element at the K-th
%    quadrature point.
%
%    Input, real S_COEF(PSI_NUM), the coefficients of the
%    PSI functions associated with the scalar function S.
%
%    Output, L2NORM, the L2 norm of the scalar function S over the region.
%

%
%  #1: Sum over all basis functions to get the value of S in each element
%  at each quadrature point.
%
%  The MATMUL function requires that one of its arguments be shaped
%  like a vector, and one like a 2 dimensional matrix, so we have
%  to insert a loop on the quadrature points.
%
  for j = 1 : quad_num
      
    s(1:element_num,j) = ...
      ( s_coef(1:psi_num) * psi_quad(1:psi_num,1:element_num,j) )';

  end
%
%  #2: Sum over all elements to get the value of S * S weighted by its element
%  area.  SUM expects to see vector quantities, so we have a loop on
%  quadrature points.
%
  for k = 1 : quad_num
    t(k) = ( s(1:element_num,k).^2 )' * element_area(1:element_num)';
  end
%
%  #3: Sum over all quadrature points weighted by the quadrature weight.
%
  u = t(1:quad_num) * quad_weight(1:quad_num)';

  l2norm = sqrt ( u );

  return
end
