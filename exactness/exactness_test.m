function exactness_test ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST tests the EXACTNESS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXACTNESS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the EXACTNESS library.\n' );

  exactness_test01 ( );
  exactness_test015 ( );
  exactness_test02 ( );
  exactness_test03 ( );
  exactness_test04 ( );
  exactness_test05 ( );
  exactness_test06 ( );
  exactness_test07 ( );
  exactness_test08 ( );
  exactness_test085 ( );
  exactness_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXACTNESS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
