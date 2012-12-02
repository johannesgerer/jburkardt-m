function subpak_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests BMI_ENGLISH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  BMI_ENGLISH computes the Body Mass Index\n' );
  fprintf ( 1, '  given body measurements in English Units.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Weight         Height            BMI\n' );
  fprintf ( 1, '       (LB)     (FT           IN)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    b = 100.0;
    c = 250.0;

    [ w, seed ] = r8_uniform ( b, c, seed );

    b = 4.0;
    c = 6.75;

    [ h, seed ] = r8_uniform ( b, c, seed );

    h_ft = round ( h );
    h_in = round ( 12.0 * ( h - h_ft ) );

    bmi = bmi_english ( w, h_ft, h_in );

    fprintf ( 1, '  %8f  %8f  %8f  %8f\n', w, h_ft, h_in, bmi );

  end

  return
end
