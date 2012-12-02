function st_to_hb_test ( )

%*****************************************************************************80
%
%% ST_TO_HB_TEST runs the ST_TO_HB tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_HB_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ST_TO_HB library.\n' );

  st_to_hb_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_HB_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function st_to_hb_test01 ( )

%*****************************************************************************80
%
%% ST_TO_HB_TEST01 tests ST_TO_HB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_HB_TEST01\n' );
  fprintf ( 1, '  Use ST_TO_HB to read an ST file,\n' );
  fprintf ( 1, '  and write an equivalent HB file.\n' );

  input_file = 'st_to_hb_test01.st';
  output_file = 'st_to_hb_test01.hb';

  st_to_hb ( input_file, output_file );


  return
end
