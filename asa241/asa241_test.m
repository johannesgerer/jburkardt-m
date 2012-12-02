function asa241_test ( )

%*****************************************************************************80
%
%% ASA241_TEST tests ASA241.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp (  );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA241_PRB:\n' );
  fprintf ( 1, '  Test the routines in ASA241 (MATLAB version).\n' );

  asa241_test01 ( );
  asa241_test02 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA241_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
