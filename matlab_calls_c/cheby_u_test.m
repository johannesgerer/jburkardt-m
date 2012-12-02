%% CHEBY_U_TEST tests the use of the MEX file CHEBY_U.C
%
%  Discussion:
%
%    The file cheby_u.c is a C function which computes the 
%    Chebyshev U polynomials.
%
%    This M file "compiles" cheby_u.c, and then shows how it can be called.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBY_U_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate a simple use of the MEX compiler,\n' );
  fprintf ( 1, '  which allows MATLAB to call C functions.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get a directory listing.  The file CHEBY_U.C should be there.\n' );

  ls
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compile the file CHEBY_U.C.\n' );

  mex cheby_u.c

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get a directory listing.  A new file should show up,\n' );
  fprintf ( 1, '  containing the compiled information.\n' );

  ls

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use CHEBY_U as though it were a MATLAB M-file\n' );
  fprintf ( 1, '  function.\n' );

  n = 12;
  x = 0.2;

  cx_check(1:n+1) = [ ...
     1.0000000000, ...
     0.4000000000, ...
    -0.8400000000, ...
    -0.7360000000, ...
     0.5456000000, ...
     0.9542400000, ...
    -0.1639040000, ...
    -1.0198016000, ...
    -0.2440166400, ... 
     0.9221949440, ...
     0.6128946176, ...
    -0.6770370970, ...
    -0.8837094564 ];

  cx = cheby_u ( n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluation point X = %f\n', x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N           U(N,X)          U(N,X)\n' );
  fprintf ( 1, '           (computed)     (tabulated)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n + 1

    fprintf ( 1, '  %2d  %14f  %14f\n', i-1, cx(i), cx_check(i) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBY_U_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
