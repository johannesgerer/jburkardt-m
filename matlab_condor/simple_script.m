fprintf ( 1, '\n' );
fprintf ( 1, '%s\n', datestr ( datevec ( now ), 0 ) );

fprintf ( 1, '\n' );
fprintf ( 1, 'SIMPLE_SCRIPT:\n' );
fprintf ( 1, '  MATLAB version.\n' );
fprintf ( 1, '  Call SIMPLE_FUNCTION for a computation.\n' );

x = 10;
y = 16;
z = simple_function ( x, y );

fprintf ( 1, '\n' );
fprintf ( 1, '  Results:\n' );
fprintf ( 1, '    X = %f\n', x );
fprintf ( 1, '    Y = %f\n', y );
fprintf ( 1, '    Z = %f\n', z );
%
%  Save the workspace as an MAT file.
%
work_file = 'simple.mat';
fprintf ( 1, '\n' );
fprintf ( 1, '  Saving MATLAB workspace in "%s".\n', work_file );
save ( work_file );
%
%  Terminate.
%
fprintf ( 1, '\n' );
fprintf ( 1, 'SIMPLE_SCRIPT:\n' );
fprintf ( 1, '  Normal end of execution.\n' );
fprintf ( 1, '\n' );
fprintf ( 1, '%s\n', datestr ( datevec ( now ), 0 ) );

