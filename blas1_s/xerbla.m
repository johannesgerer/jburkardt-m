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
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
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
