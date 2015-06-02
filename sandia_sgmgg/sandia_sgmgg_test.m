function sandia_sgmgg_test ( )

%*****************************************************************************80
%
%% SANDIA_SGMGG_TEST tests the SANDIA_SGMGG library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_SGMGG_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SANDIA_SGMGG library.\n' );

  sandia_sgmgg_test01 ( );
  sandia_sgmgg_test02 ( );
  sandia_sgmgg_test03 ( );
  sandia_sgmgg_test04 ( );
  sandia_sgmgg_test05 ( );
  sandia_sgmgg_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_SGMGG_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
