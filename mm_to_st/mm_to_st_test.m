function mm_to_st_test ( )

%*****************************************************************************80
%
%% MM_TO_ST_TEST tests MM_TO_ST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_TO_ST_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MM_TO_ST library.\n' );

  input_file = 'wathen_29_29_adg.mm';
  output_file = 'wathen_29_29_adg.st';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will read  the file "%s".\n', input_file );
  fprintf ( 1, '  We will write the file "%s".\n', output_file );

  mm_to_st ( input_file, output_file );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_TO_ST_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
