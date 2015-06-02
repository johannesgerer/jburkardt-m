function medit_io_test ( )

%*****************************************************************************80
%
%% MEDIT_IO_TEST tests the MEDIT_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Pascal Frey,
%    MEDIT: An interactive mesh visualization software,
%    Technical Report RT-0253,
%    Institut National de Recherche en Informatique et en Automatique,
%    03 December 2001.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEDIT_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MEDIT_IO library.\n' );
%
%  Create the file hexahexa_2x2x2.mesh
%
  medit_io_test01 ( );
%
%  Read and print the file hexahexa_2x2x2.mesh.
%
  filename = 'hexahexa_2x2x2.mesh';
  medit_io_test03 ( filename );
%
%  Create the file cyl248.mesh
%
  medit_io_test02 ( );
%
%  Read and print the sizes of file cyl248.mesh.
%
  filename = 'cyl248.mesh';
  medit_io_test03 ( filename );
%
%  Read and print the data in file cyl248.mesh.
%
  filename = 'cyl248.mesh';
  medit_io_test04 ( filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MEDIT_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n'  );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
