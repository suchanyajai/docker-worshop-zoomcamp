print("Running Script ....")
import pandas as pd
from sqlalchemy import create_engine
from tqdm.auto import tqdm
import click


@click.command()
@click.option('--pg-user', default='root', help='PostgreSQL username')
@click.option('--pg-pass', default='root', help='PostgreSQL password')
@click.option('--pg-host', default='localhost', help='PostgreSQL host')
@click.option('--pg-port', type=int, default=5432, help='PostgreSQL port')
@click.option('--pg-db', default='ny_taxi', help='PostgreSQL database name')
@click.option('--table', '--target-table', 'table', default='zone_taxi', help='Target table name')
@click.option('--chunksize', type=int, default=100000, help='Chunk size for reading CSV')

def run(pg_user, pg_pass, pg_host, pg_port, pg_db, table, chunksize, url = None):
    """Ingest NYC taxi data into PostgreSQL database."""
    
    if url is None:
        # prefix = 'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/'
        url = 'taxi_zone_lookup.csv'
    
    engine = create_engine(
        f'postgresql+psycopg2://{pg_user}:{pg_pass}@{pg_host}:{pg_port}/{pg_db}'
    )

    df_iter = pd.read_csv(
        url,
        iterator=True,
        chunksize=chunksize,  
    )

    first = True
    for df_chunk in tqdm(df_iter):
        if first:
            df_chunk.head(0).to_sql(
                name=table, 
                con=engine, 
                if_exists='replace'
            )
            print(f"Table Created : {table}")
            first = False

        df_chunk.to_sql(
            name=table, 
            con=engine, 
            if_exists='append'
        )
        
        print(f"Interted {len(df_chunk)} rows in table")
        
    
    click.echo(f"✓ Data ingestion complete. Loaded into table '{table}'")


if __name__ == '__main__':
    
    run()

