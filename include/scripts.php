 <div class="modal">
   <button class="modal-close"> <i class="fas fa-times"></i></button>
   <div class="modal-content">
     <div class="modal-mody">
       <?php display_detail_products(); ?>
     </div>
   </div>
 </div>
 <!-- Optional JavaScript -->
 <script>
   let base_url = <?= (BASE_URL) ? "'" . BASE_URL . "'" : '' ?>
 </script>
 <script src="<?= BASE_URL ?>assets/js/main.js"> </script>
 <script src="<?= BASE_URL ?>assets/js/util.js"> </script>
 </body>

 </html>