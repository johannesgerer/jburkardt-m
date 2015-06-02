function a = r8vec_even ( n, alo, ahi )

%*****************************************************************************80
%
%% R8VEC_EVEN returns N real values, evenly spaced between ALO and AHI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values.
%
%    Input, real ALO, AHI, the low and high values.
%
%    Output, real A(N), N evenly spaced values.
%    Normally, A(1) = ALO and A(N) = AHI.
%    However, if N = 1, then A(1) = 0.5*(ALO+AHI).
%
  if ( n == 1 )

    a(1) = 0.5 * ( alo + ahi );

  else

    a(1:n) = ( (n-1:-1:0) * alo + (0:n-1) * ahi ) / ( n - 1 );

  end

  return
end
