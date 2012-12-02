function latinize_test ( )

%*****************************************************************************80
%
%% LATINIZE_TEST tests the LATINIZE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATINIZE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LATINIZE library.\n' );

  latinize_test01 ( 'cvt_02_00010.txt' );
  latinize_test01 ( 'cvt_03_00007.txt' );
  latinize_test01 ( 'cvt_03_00056.txt' );
  latinize_test01 ( 'cvt_07_00100.txt' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATINIZE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
