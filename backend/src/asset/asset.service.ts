// Update Service (Logika Bisnis)

import { Injectable } from '@nestjs/common';
import { CreateAssetDto } from './dto/create-asset.dto';
import { UpdateAssetDto } from './dto/update-asset.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { Asset } from './entities/asset.entity';

// Kita inject Repository (mirip Eloquent).

@Injectable()
export class AssetService {
  constructor(
    @InjectRepository(Asset)
    private assetRepository: Repository<Asset>,
  ) {}

  create(createAssetDto: CreateAssetDto) {
    return this.assetRepository.save(createAssetDto);
  }

  findAll() {
    return this.assetRepository.find();
  }

  findOne(id: number) {
    return this.assetRepository.findOneBy({ asset_id: id });
  }

  update(id: number, updateAssetDto: UpdateAssetDto) {
    return this.assetRepository.update(id, updateAssetDto);
  }

  remove(id: number) {
    return this.assetRepository.delete(id);
  }
}