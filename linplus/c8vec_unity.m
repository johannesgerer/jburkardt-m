function a = c8vec_unity ( n )

%*****************************************************************************80
%
%% C8VEC_UNITY returns the N roots of unity.
%
%  Discussion:
%
%    X(1:N) = exp ( 2 * PI * (0:N-1) / N )
%
%    X(1:N)**N = ( (1,0), (1,0), ..., (1,0) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Output, complex A(N), the N roots of unity.
%

%
%  Yes, I realize that in MATLAB "i" already means sqrt(-1).
%  But to me, "i" means an array index, and nothing else.
%
  imaginary = sqrt ( -1.0 );

  for i = 1 : n
    theta = 2 * pi * ( i - 1 ) / n;
    a(i) = cos ( theta ) + imaginary * sin ( theta );
  end

  return
end
