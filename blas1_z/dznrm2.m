function value = dznrm2 ( n, x, incx )

%*****************************************************************************80
%
%% DZNRM2 returns the euclidean norm of a complex vector.
%
%  Discussion:
%
%    DZNRM2 := sqrt ( sum ( conjg ( x(1:n) ) * x(1:n) ) )
%            = sqrt ( dot_product ( x(1:n), x(1:n) ) )
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
%    Input, integer N, the number of entries in the vector.
%
%    Input, complex X(*), the vector.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Output, real VALUE, the norm of the vector.
%
  value = sqrt ( sum ( ( real ( x(1:incx:1+(n-1)*incx) ) ).^2 ) ...
               + sum ( ( imag ( x(1:incx:1+(n-1)*incx) ) ).^2 ) );

  return
end
