function xerbla ( srname, info )

%*****************************************************************************80
%
%% XERBLA is an error handler for the LAPACK routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt.
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
%    Basic Linear Algebra Subprograms for Fortran Usage,
%    Algorithm 539,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, September 1979, pages 308-323.
%
%  Parameters:
%
%    Input, character SRNAME(*), the name of the routine
%    which called XERBLA.
%
%    Input, integer INFO, the position of the invalid parameter in
%    the parameter list of the calling routine.
%
  fprintf ( 1, ...
    '  ** On entry to %s, parameter number %d had an illegal value.', ...
    srname, info );

  error ( 'XERBLA - Fatal error!' );

  return
end
