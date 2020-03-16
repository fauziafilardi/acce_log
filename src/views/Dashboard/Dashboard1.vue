<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__title">
      <b-row>
        <b-col cols="12">
          {{ $t("dashboard") }}
        </b-col>
      </b-row>
    </div>
    <div class="dashboard-page-chart__body">
      <!-- <b-row>
        <b-col cols="2">
          <div class="box--counting box-outline--red">
            <div class="box--counting__number">23</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="2">
          <div class="box--counting box-outline--green">
            <div class="box--counting__number">100</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="2">
          <div class="box--counting box-outline--green">
            <div class="box--counting__number">100</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="3">
          <div class="box--counting box-outline--grey">
            <div class="box--counting__number">45</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="3">
          <div class="box--counting box-outline--blue">
            <div class="box--counting__number">1500</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="6">
          <div class="box--counting">
            <div class="box--counting__number">23</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="6">
          <div class="box--counting">
            <div class="box--counting__number">1456</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="6">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col cols="6">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="4">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col cols="4">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col cols="4">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <area-chart :data="dataArea"></area-chart>
            </div>
          </div>
        </b-col>
      </b-row> -->
      <!-- <b-row>
        <b-col md="12">
          <b-row>
            <b-col md="12">
              <div class="box--graphic__body">
                <div class="card">
                  <div class="card-header">Pie Chart</div>
                  <div class="card-body">
                    <pie-chart :data="dataPie"></pie-chart>
                  </div>
                </div>
              </div>              
            </b-col>
          </b-row>                     
        </b-col>
      </b-row>  -->
          <b-row style="margin: 0px !important;">
            <b-col md="12" style="padding: 5px !important">
              <div class="card">
                  <div class="card-header">Area Chart</div>
                  <div class="card-body">
                    <area-chart :data="dataArea" :library="{backgroundColor: '#c69500'}"></area-chart>                    
                  </div>
                </div>
            </b-col>            
          </b-row>
          <b-row style="margin: 0px !important;">
            <b-col md="6" style="padding: 5px !important">
              <div class="card">
                  <div class="card-header">Line Chart</div>
                  <div class="card-body">
                    <line-chart :data="dataLine"/>
                  </div>
                </div>
            </b-col>
            <b-col md="6" style="padding: 5px !important">
              <div class="card">
                  <div class="card-header">Column Chart</div>
                  <div class="card-body">
                    <column-chart :data="dataColumn" :colors="['#b00', '#666', '#28a745']" :borderColor="['#b00', '#666', '#28a745']"></column-chart>
                  </div>
                </div>
            </b-col>
          </b-row>


          <b-row style="margin: 0px !important;">        
            <b-col md="3" style="padding: 5px !important">              
                <div class="card">
                  <div class="card-header">Pie Chart</div>
                  <div class="card-body">
                    <pie-chart :data="dataPie"></pie-chart>
                  </div>
                </div>              
            </b-col>
            <b-col md="3" style="padding: 5px !important">              
                <div class="card">
                  <div class="card-header">Pie Chart</div>
                  <div class="card-body">
                    <pie-chart :data="dataPie" :donut="true" :library="{backgroundColor: '#c69500'}" :colors="['#b00', '#666']" :borderColor="['#b00', '#666']"></pie-chart>
                    <!-- <pie-chart :data="dataPie" :donut="true"></pie-chart> -->
                  </div>
                </div>              
            </b-col>
            <b-col md="3" style="padding: 5px !important">              
                <div class="card">
                  <div class="card-header">Pie Chart</div>
                  <div class="card-body">
                    <pie-chart :data="dataPie" :donut="true" :library="{cutoutPercentage: 10}"></pie-chart>
                  </div>
                </div>              
            </b-col>
            <b-col md="3" style="padding: 5px !important">              
                <div class="card">
                  <div class="card-header">Pie Chart</div>
                  <div class="card-body">
                    <pie-chart :data="dataPie" :dataset="{borderWidth: 10}"></pie-chart>
                  </div>
                </div>              
            </b-col>
          </b-row>                    
          <b-row style="margin: 0px !important;">            
              <b-col md="6" style="padding: 5px !important">
                <div class="card">
                    <div class="card-header">Bar Chart</div>
                    <div class="card-body">
                      <bar-chart :data="dataBar"></bar-chart>
                    </div>
                  </div>
              </b-col>            
          </b-row>
        <!-- </b-col>        
      </b-row>      -->
    </div>
    <!-- <div class="dashboard-page__body">
      <b-row>
        <b-col cols="4">
          <div class="container-fluid">
            <div class="animated fadeIn">
              <div class="card">
                <div class="card-header">Pie Chart</div>
                <div class="card-body">
                  <pie-chart :data="dataPie"></pie-chart>
                </div>
              </div>
            </div>
          </div>
        </b-col>
        <b-col cols="4">
          <div class="container-fluid">
            <div class="animated fadeIn">
              <div class="card">
                <div class="card-header">Line Chart</div>
                <div class="card-body">
                  <line-chart :data="dataLine"/>
                </div>
              </div>
            </div>
          </div>
        </b-col>
        <b-col cols="4">
          <div class="container-fluid">
            <div class="animated fadeIn">
              <div class="card">
                <div class="card-header">Area Chart</div>
                <div class="card-body">
                  <area-chart :data="dataArea"></area-chart>
                </div>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
    </div> -->
    <!-- <div class="dashboard-page__body">
      <b-row>
        <b-col cols="4">           -->
          <!-- <b-form-input
            type="text"
            v-model="value"
            class="text-field-form"
          />
          <iframe :src="value" style="border:none;height:550px;width:1000px;"></iframe> -->
          <!-- <ABSPreviewReport
              cVisible="true"
              :cSrc="dataurl"
          /> -->
        <!-- </b-col>
      </b-row>
    </div> -->
  </div>
</template>

<script>
export default {
  data () {
    return {
      dataurl:'http://192.168.6.98/ReportPams/ReportsTemplate?Oid=cfcd208495d565ef66e7dff9f98764da',
      dataPie: [
        ['Blueberry', 44],
        ['Strawberry', 23],
        ['Banana', 23],
        ['Apple', 23],
        ['Grape', 23],
      ],
      dataBar: [
        ['Blueberry', 44],
        ['Strawberry', 23],
        ['Banana', 23],
        ['Apple', 23],
        ['Grape', 23],
      ],
      dataColumn: [
        ['Blueberry', 44],
        ['Strawberry', 23],
        ['Banana', 23],
        ['Apple', 23],
        ['Grape', 23],
      ],
      dataArea: {
        '2017-01-01 00:00:00 -0800': 2,
        '2017-01-02 00:01:00 -0800': 5,
        '2017-01-03 00:02:00 -0800': 10,
        '2017-01-04 00:03:00 -0800': 11,
        '2017-01-05 00:04:00 -0800': 30,
        '2017-01-06 00:05:00 -0800': 45,
        '2017-01-07 00:06:00 -0800': 50,
        '2017-01-08 00:07:00 -0800': 10
      },
      dataLine: [
        {name: 'Workout', data: {'2017-01-01 00:00:00 -0800': 3, '2017-01-02 00:00:00 -0800': 4, '2017-01-3 00:00:00 -0800': 7}},
        {name: 'Call parents', data: {'2017-01-01 00:00:00 -0800': 10, '2017-01-02 00:00:00 -0800': 6, '2017-01-4 00:00:00 -0800': 3}},
        {name: 'Testimoni', data: {'2017-01-01 00:00:00 -0800': 4, '2017-01-02 00:00:00 -0800': 8, '2017-01-5 00:00:00 -0800': 6}},
        {name: 'Eat', data: {'2017-01-01 00:00:00 -0800': 7, '2017-01-02 00:00:00 -0800': 10, '2017-01-3 00:00:00 -0800': 4}},
        {name: 'Drink', data: {'2017-01-01 00:00:00 -0800': 8, '2017-01-02 00:00:00 -0800': 12, '2017-01-3 00:00:00 -0800': 9}},
        {name: 'Summary', data: {'2017-01-01 00:00:00 -0800': 5, '2017-01-02 00:00:00 -0800': 14, '2017-01-3 00:00:00 -0800': 8}},
      ]
    }
  },
  mounted() {
    // this.$store.commit('setHideSideMenu', true)
  }

}
</script>
