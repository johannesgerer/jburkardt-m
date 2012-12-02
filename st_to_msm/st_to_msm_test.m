function st_to_msm_test ( )

%*****************************************************************************80
%
%% ST_TO_MSM_TEST runs the ST_TO_MSM tests.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_MSM_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ST_TO_MSM library.\n' );

  st_to_msm_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_MSM_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function st_to_msm_test01 ( )

%*****************************************************************************80
%
%% ST_TO_MSM_TEST01 tests ST_TO_MSM.
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
  fprintf ( 1, 'ST_TO_MSM_TEST01\n' );
  fprintf ( 1, '  Use ST_TO_MSM to read an ST file,\n' );
  fprintf ( 1, '  and create a MATLAB Sparse Matrix.\n' );

  input_file = 'st_to_msm_test01.st';

  b = st_to_msm ( input_file )

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
