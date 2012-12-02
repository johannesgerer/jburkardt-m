function asa183_test

%*****************************************************************************80
%
%% MAIN is the main program for ASA183_PRB.
%
%  Discussion:
%
%    ASA183_PRB calls sample problems for the ASA183 library.
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
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA183_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the routines in the ASA183 library.\n' );

  asa183_test01 ( );
  asa183_test02 ( );
  asa183_test03 ( );

  asa183_test04 ( );
  asa183_test05 ( );
  asa183_test06 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA183_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
