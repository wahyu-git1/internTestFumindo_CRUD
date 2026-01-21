// mirip file Model di Laravel.

import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

export enum AssetCategory {
  CONSUMABLE = 'Consumable',
  NON_CONSUMABLE = 'Non-Consumable',
}

@Entity()

export class Asset {
  @PrimaryGeneratedColumn()
  asset_id: number;

  @Column()
  asset_name: string;

  @Column('int')
  stock_quantity: number;

  @Column({
    type: 'enum',
    enum: AssetCategory,
    default: AssetCategory.CONSUMABLE
  })
  category: AssetCategory;
}