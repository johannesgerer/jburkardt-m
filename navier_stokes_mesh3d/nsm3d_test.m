function nsm3d_test ( )

%*****************************************************************************80
%
%% NSM3D_TEST examines the NAVIER_STOKES_MESH3D data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NSM3D_TEST\n' );
  fprintf ( 1, '  Examine data files from NAVIER_STOKES_MESH3D.\n' );

  prefix_test{1} = 'cylinder_3d';
  prefix_test{2} = 'step_3d';

  for test = 1 : 2
    prefix = prefix_test{test};
    nsm3d_test01 ( prefix );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NSM3D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

