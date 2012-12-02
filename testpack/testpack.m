function testpack ( )

%*****************************************************************************80
%
%% TESTPACK is the main program.
%
%  Discussion:
%
%    TESTPACK is a collection of several items, including six test
%    integrand functions, an early version of ADAPT, a multidimensional
%    quadrature program, and MULTST, a routine that tests quadrature programs
%    on the test integrands.  These have all been combined to make
%    an executable program that demonstrates the testing process.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2007
%
%  Author:
%
%    Alan Genz
%
%    MATLAB version by John Burkardt
%
  ndiml = 5;
  tstlim = 6;
  tstmax = 6;

  difclt = [ 110.0, 600.0, 600.0, 100.0, 150.0, 100.0 ];
  expnts = [ 1.5, 2.0, 2.0, 1.0, 2.0, 2.0 ];
  maxpts = 10000;
  ndims = [ 2, 3, 4, 6, 8 ];
  nsamp = 20;
  rel_tol = 1.0E-06;
  sbname = 'ADAPT';
  tstfns = [ 1, 2, 3, 4, 5, 6 ];

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TESTPACK\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call MULTST, which can test a routine that\n' );
  fprintf ( 1, '  is designed to estimate multidimensional\n' );
  fprintf ( 1, '  integrals, by numerical quadrature.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The routine to be tested here is called ADAPT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The test integrands are Genz''s standard set.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MULTST, ADAPT and the test integrands were\n' );
  fprintf ( 1, '  written in FORTRAN77 by Alan Genz.\n' );

  multst ( nsamp, tstlim, tstfns, tstmax, difclt, ...
    expnts, ndiml, ndims, sbname, @adapt, rel_tol, maxpts );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TESTPACK\n' );
  fprintf ( 1, '  Normal end of execution\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
