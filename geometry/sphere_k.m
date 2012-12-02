function value = sphere_k ( n )

%*****************************************************************************80
%
%% SPHERE_K computes a factor useful for spherical computations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Thomas Ericson, Victor Zinoviev,
%    Codes on Euclidean Spheres,
%    Elsevier, 2001, pages 439-441.
%    LC: QA166.7 E75
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Output, real VALUE, the factor.
%
  if ( mod ( n, 2 ) == 0 )
    value = ( 2.0 * pi )^( n / 2 );
  else
    value = 2.0 * ( 2.0 * pi )^((n-1)/2);
  end

  value = value / i4_factorial2 ( n - 2 );

  return
end
