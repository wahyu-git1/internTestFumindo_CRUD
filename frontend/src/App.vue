<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

// State
// definisi tiap variabel reaktif
const assets = ref([])
const form = ref({
  asset_name: '',
  stock_quantity: 0,
  category: 'Consumable'
})
const isEdit = ref(false)
const editId = ref(null)

const API_URL = 'http://localhost:3000/asset'

// Methods
const fetchAssets = async () => {
  try {
    const res = await axios.get(API_URL)
    assets.value = res.data
  } catch (err) {
    console.error(err)
  }
}

const saveAsset = async () => {
  try {
    if (isEdit.value) {
      await axios.patch(`${API_URL}/${editId.value}`, form.value)
    } else {
      await axios.post(API_URL, form.value)
    }
    resetForm()
    fetchAssets()
  } catch (err) {
    alert('Gagal menyimpan data')
  }
}

const editAsset = (asset) => {
  isEdit.value = true
  editId.value = asset.asset_id
  form.value = { ...asset } // Copy object
}

const deleteAsset = async (id) => {
  if(!confirm('Hapus asset ini?')) return
  try {
    await axios.delete(`${API_URL}/${id}`)
    fetchAssets()
  } catch (err) {
    alert('Gagal menghapus')
  }
}

const resetForm = () => {
  form.value = { asset_name: '', stock_quantity: 0, category: 'Consumable' }
  isEdit.value = false
  editId.value = null
}

// Lifecycle (mirip mounted di Vue Options API)
onMounted(() => {
  fetchAssets()
})
</script>



<template>
  <div style="padding: 20px; font-family: sans-serif;">
    <h1>Asset Management (Fumindo)</h1>
    
    <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px;">


      <h3>{{ isEdit ? 'Edit Asset' : 'Tambah Asset' }}</h3>


      <form @submit.prevent="saveAsset">

        <div style="margin-bottom: 10px;">
          <label>Nama Asset:</label><br>
          <input v-model="form.asset_name" required style="width: 100%; padding: 5px;">
        </div>

        <div style="margin-bottom: 10px;">
          <label>Jumlah Stok:</label><br>
          <input type="number" v-model="form.stock_quantity" required style="width: 100%; padding: 5px;">
        </div>


        <div style="margin-bottom: 10px;">
          <label>Kategori:</label><br>
          <select v-model="form.category" style="width: 100%; padding: 5px;">
            <option value="Consumable">Consumable</option>
            <option value="Non-Consumable">Non-Consumable</option>
          </select>
        </div>

        
        <button type="submit">{{ isEdit ? 'Update' : 'Simpan' }}</button>
        <button type="button" v-if="isEdit" @click="resetForm" style="margin-left: 10px;">Batal</button>
      </form>
    </div>

    <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: left;">
      <thead>
        <tr>
          <th>ID</th>
          <th>Nama</th>
          <th>Stok</th>
          <th>Kategori</th>
          <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="asset in assets" :key="asset.asset_id">
          <td>{{ asset.asset_id }}</td>
          <td>{{ asset.asset_name }}</td>
          <td>{{ asset.stock_quantity }}</td>
          <td>{{ asset.category }}</td>
          <td>
            <button @click="editAsset(asset)">Edit</button>
            <button @click="deleteAsset(asset.asset_id)" style="color: red; margin-left: 5px;">Hapus</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>


