function toms743_test ( )

%*****************************************************************************80
%
%% TOMS743_TEST tests TOMS743.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Andrew Barry, S. J. Barry, 
%    Patricia Culligan-Hensley.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Andrew Barry, S. J. Barry, Patricia Culligan-Hensley,
%    Algorithm 743: WAPR - A Fortran routine for calculating real 
%    values of the W-function,
%    ACM Transactions on Mathematical Software,
%    Volume 21, Number 2, June 1995, pages 172-181.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS743_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TOMS743 library.\n' );

  nbits = nbits_compute ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of bits in mantissa - 1 = %d\n', nbits );

  toms743_test01 ( nbits );

  dx = + 1.0E-09;
  n = 10;
  toms743_test02 ( nbits, dx, n );

  xmin = 0.0;
  xmax = 1.0E+20
  n = 20;
  toms743_test03 ( nbits, xmin, xmax, n );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS743_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end