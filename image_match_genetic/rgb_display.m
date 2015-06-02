function rgb_display ( rgb, header )

%*****************************************************************************80
%
%% RGB_DISPLAY displays an RGB dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nick Berry,
%    A "Practical" Use for Genetic Programming,
%    http://www.datagenetics.com/blog.html
%
%  Parameters:
%
%    Input, uint8 RGB(256,256,3), the RGB information.
%
%    Input, string HEADER, an identifier used for the title and filename.
%
  imshow ( rgb )
  title ( header, 'FontSize', 16 )

  filename = sprintf ( '%s.png', header );
  print ( '-dpng', filename );

  return
end

