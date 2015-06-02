function [ A, B, M, n_nodes, x ] = heat_oned_setup ( mu, h, rho, degree, ...
  xa, xb )

%*****************************************************************************80
%
%% HEAT_ONED_SETUP sets up matrices needed for the 1D heat equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    Jeff Borggaard
%
%  Variables:
%
%    Input, real MU, the viscosity parameter.
%
%    Input, real H, the heat transfer coefficient.
%
%    Input, real RHO, the mesh density, that is, the number of
%    finite elements to create per unit length of the interval.
%
%    Input, integer DEGREE, the degree of the finite elements.
%    1, piecewise linear.
%    2, piecwise quadratic.
%
%    Input, real XA, XB, the left and right endpoints of the interval.
%
%    Output, real A(N_EQUATIONS,N_EQUATIONS), B(N_EQUATIONS,2), 
%    matrices corresponding to M dx/dt = Ax + Bu.
%
%    Output, real M(N_EQUATIONS,N_EQUATIONS), the mass matrix.
%

%
%  Assign default values if none given.
%
  if ( nargin == 0 )
    mu = 0.1;
    h = 100.0;
    rho = 40.0;
    xa = 0.0;
    xb = 1.0;
  end
%
%  Number of quadrature points.
%  
  n_gauss = 3;
%
%  Set the nodes and connectivity information.
%
  if ( degree == 1 )
    [ x, e_conn, index_u, index_c ] = oned_mesh ( [ xa; xb ], [ 1 2 ], rho );
  elseif ( degree == 2 )
    [ x, e_conn, index_u, index_c ] = oned_mesh ( [ xa; (xa+xb)/2.0; xb ], [ 1 2 3 ], rho );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEAT_ONED_SETUP - Fatal error!\n' );
    fprintf ( 1, '  Elements of degree %d were requested.\n', degree );
    error ( 'HEAT_ONED_SETUP - Fatal error!' )
  end

  [ n_nodes, n_dimensions ] = size ( x );
  [ n_elements, nel_dof ] = size ( e_conn );

  ide = [ -1 1:n_nodes-2 -2 ];
  n_equations = n_nodes - 2;
  
  [ A, B, M ] = compute_matricesb ( x, e_conn, mu, h, ide, n_gauss, n_equations );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of elements                      = %d\n', n_elements );
  fprintf ( 1, '  Number of nodes                         = %d\n', n_nodes );
  fprintf ( 1, '  Number of equations                     = %d\n', n_equations );
  fprintf ( 1, '  Number of quadrature points per element = %d\n', n_gauss );

  return
end                 
