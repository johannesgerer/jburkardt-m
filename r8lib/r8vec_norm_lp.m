function value = r8vec_norm_lp ( n, a, p )

%*****************************************************************************80
%
%% R8VEC_NORM_LP returns the LP norm of an R8VEC.
%
%  Discussion:
%
%    The vector LP norm is defined as:
%
%      value = ( sum ( 1 <= I <= N ) ( abs ( A(I) ) )**P )**(1/P).
%
%    Usually, the LP norms with
%      1 <= P <= Infinity 
%    are of interest.  This routine allows
%      0 < P <= Huge ( P ).  
%    If P = Huge ( P ), then the L-infinity norm is returned, which is simply the 
%    maximum of the absolute values of the vector components.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, real A(N), the vector whose LP norm is desired.
%
%    Input, real P, the index of the norm.  
%
%    Output, real VALUE, the LP norm of A.
%
  if ( p <= 0.0 )
    value = -1.0;
  elseif ( p == r8_huge ( ) )
    value = maxval ( abs ( a(1:n) ) );
  elseif ( p == 1.0 )
    value = sum ( abs ( a(1:n) ) );
  elseif ( p == 2.0 )
    value = sqrt ( sum ( a(1:n).^2 ) );
  else
    value = ( sum ( ( abs ( a(1:n) ) ).^p ) ).^( 1.0 / p );
  end

  return
end
