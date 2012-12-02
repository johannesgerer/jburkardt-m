%% FACT_TEST tests the use of the MEX file FACT.F
%
%  Discussion:
%
%    The file fact.f is a FORTRAN77 function which computes the factorial.
%
%    This M file "compiles" fact.f, and then shows how it can be called.
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
  fprintf ( 1, 'FACT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate a simple use of the MEX compiler,\n' );
  fprintf ( 1, '  which allows MATLAB to call FORTRAN77 functions.\n' );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get a directory listing.  The file FACT.F should,\n' );
  fprintf ( 1, '  show up here.\n' );

  ls
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compile the file FACT.F.\n' );

  mex fact.f

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get a directory listing.  A new file should show up,\n' );
  fprintf ( 1, '  containing the compiled information.\n' );

  ls

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use FACT as though it were a MATLAB M-file function.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   N  (N Factorial)' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    j = fact ( i );

    fprintf ( 1, '  %2d  %10d\n', i, j );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FACT_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
