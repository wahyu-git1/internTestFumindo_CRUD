// export class CreateAssetDto {
//   asset_name: string;
//   stock_quantity: number;
//   category: 'Consumable' | 'Non-Consumable';
// }


// Import AssetCategory dari entity
import { AssetCategory } from '../entities/asset.entity';

export class CreateAssetDto {
  asset_name: string;
  stock_quantity: number;
  
  // GANTI INI: Jangan pakai string manual, pakai Enum yang diimport
  category: AssetCategory; 
}