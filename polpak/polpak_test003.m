function polpak_test003 ( )

%*****************************************************************************80
%
%% TEST003 tests ALIGN_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  m_max = 10;
  n_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST003\n' );
  fprintf ( 1, '  ALIGN_ENUM counts the number of possible\n' );
  fprintf ( 1, '  alignments of two biological sequences.\n' );

  for i = 0 : m_max
    for j = 0 : n_max
      table(i+1,j+1) = align_enum ( i, j );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Alignment enumeration table:\n' );
  fprintf ( 1, '\n' );
  for j = 0 : 4
    fprintf ( 1, '%5d', j );
  end
  for j = 5 : n_max
    fprintf ( 1, '%8d', j );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  for i = 0 : m_max
    for j = 0 : 4
      fprintf ( 1, '%5d', table(i+1,j+1) );
    end
    for j = 5 : n_max
      fprintf ( 1, '%8d', table(i+1,j+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
