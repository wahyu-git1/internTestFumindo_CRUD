// import { Module } from '@nestjs/common';
// import { AppController } from './app.controller';
// import { AppService } from './app.service';

// @Module({
//   imports: [],
//   controllers: [AppController],
//   providers: [AppService],
// })
// export class AppModule {}


import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AssetModule } from './asset/asset.module';
import { Asset } from './asset/entities/asset.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      username: 'postgres', // GANTI dengan username pg kamu
      password: 'admin123', // GANTI dengan password pg kamu
      database: 'asset_fumindo',
      entities: [Asset],
      synchronize: true, // HATI-HATI: Ini akan auto-create tabel (dev only)
    }),
    AssetModule,
  ],
})
export class AppModule {}