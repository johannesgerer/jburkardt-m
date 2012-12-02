function hb_to_msm_test01 ( )

%*****************************************************************************80
%
%% HB_TO_MSM_TEST01 tests HB_TO_MSM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2005
%
%  Author:
%
%    John Burkardt
%
  input_file = 'rua_32.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_MSM_TEST01\n' );
  fprintf ( 1, '  We will read a Harwell-Boeing sparse matrix file\n' );
  fprintf ( 1, '  called "%s"\n', input_file );
  fprintf ( 1, '  and have HB_TO_MSM convert it to MATLAB sparse format.\n' );

  a = hb_to_msm ( input_file );
%
%  To verify the results, we extract the data.
%
  b = full ( a )

  return
end



