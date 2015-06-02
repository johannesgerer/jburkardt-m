function fact_test ( )

%*****************************************************************************80
%
%% FACT_TEST tests the use of the MEX file FACT.F90
%
%  Discussion:
%
%    The file fact.F90 is a FORTRAN90 function which computes the factorial.
%
%    This M file "compiles" fact.F90, and then shows how it can be called.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FACT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate a simple use of the MEX compiler,\n' );
  fprintf ( 1, '  which allows MATLAB to call FORTRAN90 functions.\n' );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get a directory listing.  The file "fact.F90" should\n' );
  fprintf ( 1, '  show up here.\n' );

  ls
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compile the file "fact.F90".\n' );

  mex fact.F90

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
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FACT_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end

