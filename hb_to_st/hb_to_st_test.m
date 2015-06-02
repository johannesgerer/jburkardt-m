function hb_to_st_test ( )

%*****************************************************************************80
%
%% HB_TO_ST_TEST tests the HB_TO_ST library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_ST_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HB_TO_ST library.\n' );

  hb_to_st_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_ST_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function hb_to_st_test01 ( )

%*****************************************************************************80
%
%% HB_TO_ST_TEST01 tests HB_TO_ST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
  input_file = 'rua_32.hb';
  output_file = 'rua_32.st';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_ST_TEST01\n' );
  fprintf ( 1, '  We will read a Harwell-Boeing sparse matrix file\n' );
  fprintf ( 1, '  called "%s"\n', input_file );
  fprintf ( 1, '  and have HB_TO_ST convert it to an ST file.\n' );

  hb_to_st ( input_file, output_file );

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
