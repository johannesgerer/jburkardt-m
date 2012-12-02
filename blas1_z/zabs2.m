function value = zabs2 ( z )

%*****************************************************************************80
%
%% ZABS2 returns the L2 norm of a complex number.
%
%  Discussion:
%
%    The L2 norm of a complex number is the square root of the sum
%    of the squares of the real and imaginary components.
%
%    ZABS2 ( Z ) = sqrt ( ( real ( Z ) )**2 + ( imaginary ( Z ) )**2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%    Charles Lawson, Richard Hanson, David Kincaid, Fred Krogh,
%    Basic Linear Algebra Subprograms for FORTRAN usage,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, pages 308-323, 1979.
%
%  Parameters:
%
%    Input, complex Z, the number whose norm is desired.
%
%    Output, real VALUE, the L2 norm of Z.
%
  value = sqrt ( ( real ( z ) ).^2 + ( imag ( z ) ).^2 );

  return
end
