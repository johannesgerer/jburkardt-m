function image_quantization_test ( )

%*****************************************************************************80
%
%% IMAGE_QUANTIZATION_TEST tests the IMAGE_QUANTIZATION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_QUANTIZATION_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the IMAGE_QUANTIZATION library.\n' );

  image_quantization_test01 ( 'snap.png' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_QUANTIZATION_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



