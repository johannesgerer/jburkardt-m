function nelder_mead_test ( )

%*****************************************************************************80
%
%% NELDER_MEAD_TEST tests the NELDER_MEAD library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NELDER_MEAD_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the NELDER_MEAD library.\n' );

  nelder_mead_test01 ( );
  nelder_mead_test02 ( );
  nelder_mead_test03 ( );
  nelder_mead_test04 ( );
  nelder_mead_test05 ( );
  nelder_mead_test06 ( );
  nelder_mead_test07 ( );
  nelder_mead_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NELDER_MEAD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



