function asa314_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for ASA314_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Roger Payne,
%    Inversion of matrices with contents subject to modulo arithmetic,
%    Applied Statistics,
%    Volume 46, Number 2, 1997, pages 295-298.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA314_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ASA314 library.\n' );

  asa314_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA314_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
