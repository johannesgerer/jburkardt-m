function [ qi, dqidx, dqidy ] = basis_11_t3 ( t, i, p )

%*****************************************************************************80
%
%% BASIS_11_T3: one basis at one point for the T3 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the nodes of a triangle. 
%        
%           3
%          / \
%         /   \
%        /     \
%       1-------2
%
%    It evaluates the linear basis function Q(I)(X,Y) associated with
%    node I, which has the property that it is a linear function
%    which is 1 at node I and zero at the other two nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the coordinates of the nodes.
%
%    Input, integer I, the index of the desired basis function.
%    I should be between 1 and 3.
%
%    Input, real P(2), the coordinates of a point at which the basis
%    function is to be evaluated.
%
%    Output, real QI, DQIDX, DQIDY, the values of the basis function
%    and its X and Y derivatives.
%
  area = abs ( t(1,1) * ( t(2,2) - t(2,3) ) ...
             + t(1,2) * ( t(2,3) - t(2,1) ) ...
             + t(1,3) * ( t(2,1) - t(2,2) ) );

  if ( area == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T3 - Fatal error!\n' );
    fprintf ( 1, '  Element has zero area.\n' );
    error ( 'BASIS_11_T3 - Fatal error!' );
  end

  if ( i < 1 | 3 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T3 - Fatal error!\n' );
    fprintf ( 1, '  Basis index I is not between 1 and 3.\n' );
    fprintf ( 1, '  I = %d\n', i );
    error ( 'BASIS_11_T3 - Fatal error!' );
  end

  ip1 = i4_wrap ( i + 1, 1, 3 );
  ip2 = i4_wrap ( i + 2, 1, 3 );

  qi = ( ( t(1,ip2) - t(1,ip1) ) * ( p(2) - t(2,ip1) ) ...
       - ( t(2,ip2) - t(2,ip1) ) * ( p(1) - t(1,ip1) ) ) / area;

  dqidx = - ( t(2,ip2) - t(2,ip1) ) / area;
  dqidy =   ( t(1,ip2) - t(1,ip1) ) / area;

  return
end
