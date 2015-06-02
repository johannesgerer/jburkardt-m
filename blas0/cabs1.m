function value = cabs1 ( z )

%*****************************************************************************80
%
%% CABS1 returns the L1 norm of a complex number.
%
%  Discussion:
%
%    The L1 norm of a complex number is the sum of the absolute values
%    of the real and imaginary components.
%
%    CABS1 ( Z ) = abs ( real ( Z ) ) + abs ( imaginary ( Z ) )
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
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
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
%    Output, real VALUE, the L1 norm of Z.
%
  value = abs ( real ( z ) ) + abs ( imag ( z ) );

  return
end
