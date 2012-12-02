function file_name_sequence ( )

%*****************************************************************************80
%
%% FILE_NAME_SEQUENCE demonstrates ways of generating a sequence of filenames.
%
%  Discussion:
%
%    There are situations such as animations or parallel processing in which
%    it is necessary to generate a sequence of file names which include
%    an embedded index that increases.  A simple example might be
%
%      'fred0.txt', 'fred1.txt', 'fred2.txt'
%
%    A side issue arises when the number of files is large enough that the
%    number of digits in the index will vary.  Thus, if we are going to have
%    15 files, do we want to number them as
%
%      'fred00.txt' through 'fred14.txt'
%
%    which means, for one thing, that they will alphabetize properly, or
%    will we be satisfied with
%
%      'fred0.txt' through 'fred14.txt' ?
%
%    Schemes for generating such a sequence in MATLAB can involve the
%    NUM2STR function, the SPRINTF function, or a more elaborate function
%    called FILE_NAME_INC which searches a string for embedded numeric
%    data and increments it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILE_NAME_SEQUENCE:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Demonstrate ways of generating a numeric sequence of file names.\n' );

  test01 ( 'frad', '.txt', 0, 12 );
  test02 ( 'fred', '.txt', 0, 12 );
  test03 ( 'frid', '.txt', 99, 105 );
  test04 ( 'frodo_01345_lives.txt', 10 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILE_NAME_SEQUENCE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function test01 ( prefix, suffix, first, last )

%*****************************************************************************80
%
%% TEST01 uses NUM2STR and concatenation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  FILENAME(I) = PREFIX + NUM2STR(I) + SUFFIX\n' );
  fprintf ( 1, '  PREFIX = "%s"\n', prefix );
  fprintf ( 1, '  SUFFIX = "%s"\n', suffix );
  fprintf ( 1, '  %d <= I <= %d\n', first, last );
  fprintf ( 1, '  Numbers do NOT include leading zeros.\n' );
  fprintf ( 1, '\n' );

  for i = first : last
    filename = strcat ( prefix, num2str ( i ), suffix );
    fprintf ( 1, '  %4d:  "%s"\n', i, filename );
  end

  return
end
function test02 ( prefix, suffix, first, last )

%*****************************************************************************80
%
%% TEST02 uses SPRINTF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  FILENAME(I) = SPRINTF ( PREFIX, I, SUFFIX )\n' );
  fprintf ( 1, '  PREFIX = "%s"\n', prefix );
  fprintf ( 1, '  SUFFIX = "%s"\n', suffix );
  fprintf ( 1, '  %d <= I <= %d\n', first, last );
  fprintf ( 1, '  Numbers do NOT include leading zeros.\n' );
  fprintf ( 1, '\n' );

  for i = first : last
    filename = sprintf ( '%s%d%s', prefix, i, suffix );
    fprintf ( 1, '  %4d:  "%s"\n', i, filename );
  end

  return
end
function test03 ( prefix, suffix, first, last )

%*****************************************************************************80
%
%% TEST03 uses SPRINTF and leading 0's.
%
%  Discussion:
%
%    The format in SPRINTF must include a leading "0" for the integer,
%    plus a desired width.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03:\n' );
  fprintf ( 1, '  FILENAME(I) = SPRINTF ( PREFIX, I, SUFFIX )\n' );
  fprintf ( 1, '  PREFIX = "%s"\n', prefix );
  fprintf ( 1, '  SUFFIX = "%s"\n', suffix );
  fprintf ( 1, '  %d <= I <= %d\n', first, last );
  fprintf ( 1, '  Numbers DO include leading zeros.\n' );
  fprintf ( 1, '\n' );

  for i = first : last
    filename = sprintf ( '%s%04d%s', prefix, i, suffix );
    fprintf ( 1, '  %4d:  "%s"\n', i, filename );
  end

  return
end
function test04 ( filename, filename_num )

%*****************************************************************************80
%
%% TEST04 uses FILE_NAME_INC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04:\n' );
  fprintf ( 1, '  FILENAME(I+1) = FILE_NAME_INC ( FILENAME(I) )\n' );
  fprintf ( 1, '  First FILENAME = "%s"\n', filename );
  fprintf ( 1, '  Number of filenames = %d\n', filename_num );
  fprintf ( 1, '  Numbers may include leading zeros.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : filename_num
    fprintf ( 1, '  %4d:  "%s"\n', i, filename );
    filename = file_name_inc ( filename );
  end

  return
end
