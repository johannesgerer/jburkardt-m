int **triangle_read ( string infile, int m, int n )
{
  ifstream inunit;
  int i, j;
  int **table;

  inunit.open ( infile.c_str ( ) );

  table = new int[m][n];

  for ( i = 0; i < m; i++ )
  {
    for ( j = 0; j < n; j++ )
    {
      inunit >> table[i][j];
    }
  }
  
  inunit.close ( );
  
  return table;
}
