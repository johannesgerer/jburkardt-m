function [ pols, dersx, dersy ] = ortho2eva3 ( mmax, z )

%*****************************************************************************80
%
%% ORTHO2EVA3: orthogonal polynomial values and derivatives, reference triangle.
%
%  Discussion:
%
%     This routine evaluates at the user-supplied point Z
%     a collection of polynomials (of X,Y) orthogonal on the
%     reference triangle, together with their derivatives with
%     respect to X and Y.
%
%     The reference triangle has vertices
%       (0,2/sqrt(3)), (-1,-1/sqrt(3), (1,-1/sqrt(3)).
%
%     The polynomials evaluated by this routine are all
%     orthogonal polynomials up to order mmax, arranged in the
%     increasing order.
%
%     This routine is based on the Koornwinder's representation
%     of the orthogonal polynomials on the right triangle
%       (-1,-1), (-1,1), (1,-1)
%     given by
%       K_mn(x,y) = P_m ((2*x+1+y)/(1-y)) ((1-y)/2)^m P_n^{2m+1,0} (y)
%     where P_m are the Legendre polynomials or order m
%     and P_n^{2m+1,0} are the Jacobi polynomials of order n with
%     the parameters alpha=2*m+1 and beta=0.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    27 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer MMAX, the maximum order to which the polynomials are
%    to be evaluated.
%
%    Input, real Z(2), the location where the polynomials are
%    to be evaluated; normally, expected to be inside (including boundary) the
%    reference triangle.
%
%    Output, real POLS((mmax+1)*(mmax+2)/2), the orthogonal
%    polynomials evaluated at the point Z.
%
%    Output, real DERSX((mmax+1)*(mmax+2)/2), the derivatives
%    with respect to X of the polynomials returned in array POLS.
%
%    Output, real DERSY((mmax+1)*(mmax+2)/2), the derivatives
%    with respect to Y of the polynomials returned in array POLS.
%
  c0 = 1.0 / sqrt ( 3.0 ) * sqrt ( sqrt ( 3.0 ) );
  c1 = sqrt ( 2.0 ) * sqrt ( sqrt ( 3.0 ) );
  c2 = sqrt ( 2.0 ) * sqrt ( sqrt ( 3.0 ) );

  if ( mmax == 0 )

    pols(1) = c0;
    dersx(1) = 0.0;
    dersy(1) = 0.0;

  elseif ( mmax == 1 )

    pols(1) = c0;
    pols(2) = z(1) * c1;
    pols(3) = z(2) * c2;
    dersx(1) = 0.0;
    dersx(2) = c1;
    dersx(3) = 0.0;
    dersy(1) = 0.0;
    dersy(2) = 0.0;
    dersy(3) = c2;

  else

    [ pols, dersx, dersy ] = ortho2eva30 ( mmax, z );

  end

  return
end
